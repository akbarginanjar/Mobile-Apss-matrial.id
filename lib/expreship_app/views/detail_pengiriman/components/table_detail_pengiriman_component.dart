import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class TableDetailPengirimanComponent extends StatelessWidget {
  const TableDetailPengirimanComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(120), // Set width of column 2
        1: FixedColumnWidth(20), // Set width of column 2
      },
      children: const [
        TableRow(
          children: [
            TableCell(child: Text('ID')),
            TableCell(child: Text(':')),
            TableCell(child: Text('EX-0123')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Barang')),
            TableCell(child: Text(':')),
            TableCell(child: Text('Baju')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Berat')),
            TableCell(child: Text(':')),
            TableCell(child: Text('25 KG')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Total Harga')),
            TableCell(child: Text(':')),
            TableCell(child: Text('Rp. 50.000')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Alamat')),
            TableCell(child: Text(':')),
            TableCell(child: Text('Jl. Seokarno Hatta')),
          ],
        ),
      ],
    );
  }
}
