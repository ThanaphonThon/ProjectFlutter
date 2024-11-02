import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  DateTime? startDate;
  DateTime? endDate;
  bool isWaitingApprove = true;
  bool isNotApprove = true;
  bool isApprove = true;
  bool isSaveDraft = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Date Range
          _buildDateRangeSection(),

          // Status Section
          _buildStatusSection(),

          // Filter Button
          _buildFilterButton(context),
        ],
      ),
    );
  }

  Widget _buildDateRangeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create Date',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(true),
                  child: _buildDateContainer(startDate, 'Start Date'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('ถึง'),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(false),
                  child: _buildDateContainer(endDate, 'End Date'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateContainer(DateTime? date, String placeholder) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            date?.toLocal().toString().split(' ')[0] ?? placeholder,
            style: const TextStyle(fontSize: 14),
          ),
          const Spacer(),
          const Icon(Icons.calendar_today, size: 16),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Status',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildCheckbox(
                  'Waiting Approve',
                  isWaitingApprove,
                  Colors.blue,
                  (value) => setState(() => isWaitingApprove = value!),
                ),
              ),
              Expanded(
                child: _buildCheckbox(
                  'Not Approve',
                  isNotApprove,
                  Colors.red,
                  (value) => setState(() => isNotApprove = value!),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _buildCheckbox(
                  'Approve',
                  isApprove,
                  Colors.green,
                  (value) => setState(() => isApprove = value!),
                ),
              ),
              Expanded(
                child: _buildCheckbox(
                  'Save Draft',
                  isSaveDraft,
                  Colors.grey,
                  (value) => setState(() => isSaveDraft = value!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(
    String label,
    bool value,
    Color color,
    Function(bool?) onChanged,
  ) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: color,
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // ส่งค่า filter กลับไป
            Navigator.pop(context, {
              'startDate': startDate,
              'endDate': endDate,
              'statuses': {
                'waitingApprove': isWaitingApprove,
                'notApprove': isNotApprove,
                'approve': isApprove,
                'saveDraft': isSaveDraft,
              },
            });
          },
          child: const Text(
            'Filter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }
}
