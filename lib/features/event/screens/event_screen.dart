import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/event_highlight.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Outros Eventos',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text("Próximos Eventos", style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 10),
              _buildEventCard(
                context,
                'assets/images/mega_moda.jpeg',
                'Mega Saldão',
                '20/08 às 19:00',
                'Sede da Loja',
              ),
              SizedBox(height: 10),
              _buildEventCard(
                context,
                'assets/images/caatingueiros.jpeg',
                'Noite de Forró',
                '10:00',
                'Endereço',
              ),
              SizedBox(height: 10),
              _buildEventCard(
                context,
                'assets/images/cervejaria_premium.png',
                'Aniversário do Dono',
                '20:00',
                'Endereço',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, String imagePath, String eventName, String time, String date) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16),
                    SizedBox(width: 5),
                    Text(time),
                    SizedBox(width: 10),
                    Icon(Icons.location_pin, size: 16),
                    SizedBox(width: 5),
                    Text(date),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}