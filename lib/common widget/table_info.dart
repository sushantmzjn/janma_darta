import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janma_darta/constant/text_styles.dart';

class LeftHeaderTable extends StatelessWidget {
  final List<String> leftHeaders;
  final List<List<String>> data;

  LeftHeaderTable({required this.leftHeaders, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0, color: Colors.black54),
      columnWidths: {
        0: FixedColumnWidth(115.w),
      },
      children: [
        // Table header row with left headers
        for (int i = 0; i < data.length; i++)
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                  ),
                  child: Text(leftHeaders[i], style: TextStyles.hintStyle),
                ),
              ),
              // Data rows with corresponding data
              for (int j = 0; j < data[i].length; j++)
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Text(data[i][j], style: TextStyles.hintStyle),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
