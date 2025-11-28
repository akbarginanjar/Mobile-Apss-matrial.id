import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class SemuaRiwayat extends StatelessWidget {
  const SemuaRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: white,
            surfaceTintColor: white,
            elevation: 15,
            shadowColor: const Color.fromARGB(130, 245, 245, 245),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akbar Ginanjar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text('Jl. Seokarna Hatta'),
                  const Text('Barang : Baju'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ID : EX-0123'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Detail'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: white,
            surfaceTintColor: white,
            elevation: 15,
            shadowColor: const Color.fromARGB(130, 245, 245, 245),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akbar Ginanjar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text('Jl. Seokarna Hatta'),
                  const Text('Barang : Baju'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ID : EX-0123'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Detail'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: white,
            surfaceTintColor: white,
            elevation: 15,
            shadowColor: const Color.fromARGB(130, 245, 245, 245),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akbar Ginanjar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text('Jl. Seokarna Hatta'),
                  const Text('Barang : Baju'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ID : EX-0123'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Detail'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: white,
            surfaceTintColor: white,
            elevation: 15,
            shadowColor: const Color.fromARGB(130, 245, 245, 245),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akbar Ginanjar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text('Jl. Seokarna Hatta'),
                  const Text('Barang : Baju'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ID : EX-0123'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Detail'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: white,
            surfaceTintColor: white,
            elevation: 15,
            shadowColor: const Color.fromARGB(130, 245, 245, 245),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akbar Ginanjar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  const Text('Jl. Seokarna Hatta'),
                  const Text('Barang : Baju'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ID : EX-0123'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Detail'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
