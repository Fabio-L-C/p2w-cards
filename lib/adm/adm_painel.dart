import 'package:flutter/material.dart';
import 'package:p2w_cards/adm/adm_order.dart';
import 'package:provider/provider.dart';

class AdmPainel extends StatelessWidget {
  const AdmPainel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final admOrder = Provider.of<AdmOrder>(context);

    return DataTable(
      columns: const [
        DataColumn(label: Text('idPessoa')),
        DataColumn(label: Text('nomePessoa')),
        DataColumn(label: Text('emailPessoa')),
        DataColumn(label: Text('cpfPessoa')),
        DataColumn(label: Text('idJogo')),
        DataColumn(label: Text('nomeJogo')),
        DataColumn(label: Text('price')),
        DataColumn(label: Text('Ação')),
      ],
      rows: [
        ...List.generate(
            admOrder.orderListCount, (index) => tabela(admOrder, index))
      ],
    );
  }

  DataRow tabela(AdmOrder admOrder, int index) {
    return DataRow(
      cells: [
        DataCell(Text(admOrder.orderList[index].idPessoa)),
        DataCell(Text(admOrder.orderList[index].nomePessoa)),
        DataCell(Text(admOrder.orderList[index].emailPessoa)),
        DataCell(Text(admOrder.orderList[index].cpfPessoa)),
        DataCell(Text(admOrder.orderList[index].idJogo)),
        DataCell(Text(admOrder.orderList[index].nomeJogo)),
        DataCell(Text('${admOrder.orderList[index].price}')),
        DataCell(
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Enviar Codigo',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
