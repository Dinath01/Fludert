import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collaborators',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const CollaboratorsPage(),
    );
  }
}

class CollaboratorsPage extends StatelessWidget {
  const CollaboratorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collaborators'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 116, 65, 210),
              Colors.deepPurple.shade200
            ],
          ),
        ),
        child: ListView(
          children: [
            CollaboratorCard(
              name: 'Leo Club',
              description:
                  'Leo Club is a community that whatever blah blah blah.',
            ),
            CollaboratorCard(
              name: 'SLRCS',
              description:
                  'The Sri Lanka Red Cross Society (SLRCS) epitomizes the humanitarian spirit in Sri Lanka, tirelessly working to alleviate human suffering caused by disasters and crises. As a prominent auxiliary to the government in the realm of disaster management, the SLRCS operates through a vast network of volunteers and branches across the island. Through its multifaceted programs encompassing disaster preparedness, emergency response, and recovery, the SLRCS extends vital support to vulnerable communities, ensuring timely access to lifesaving assistance and fostering community resilience. Guided by the fundamental principles of humanity, impartiality, neutrality, independence, voluntary service, unity, and universality, the SLRCS stands as a beacon of hope in times of adversity.',
            ),
            CollaboratorCard(
              name: 'A-PAD SL',
              description:
                  'The Asia-Pacific Alliance for Disaster Management Sri Lanka (A-PAD SL) enables the Sri Lankan private sector to engage faster and more efficiently in national disaster management strategies. It is part of the National Disaster Management Coordinating Committee (NDMCC)) and works with over 700 companies and over 100 NGOs and Government partners, including the Ministry of Disaster Management and the Disaster Management Centre (DMC). A-PAD SL supports coordination in disaster risk reduction and mitigation, preparedness, response and recovery, while also facilitating capacity building efforts in Sri Lanka. More specifically, A-PAD SL’s work complements Government’s efforts by creating effective public-private partnerships (PPPs) and institutionalizing business continuity planning, thus strengthening community and business resilience. The organization also facilitates civil-military coordination in humanitarian response.',
            ),
            CollaboratorCard(
              name: 'NDRSC',
              description:
                  'The National Disaster Relief Services Center (NDRSC) serves as the frontline agency entrusted with the solemn responsibility of providing immediate relief and assistance to those affected by disasters in Sri Lanka. Operating under the aegis of the Ministry of Disaster Management, the NDRSC functions with unwavering commitment to swiftly mobilize resources, coordinate relief efforts, and deploy humanitarian aid to affected areas across the country. With a robust infrastructure and a dedicated workforce, the NDRSC ensures the timely delivery of essential services, including shelter, food, water, and medical aid, thereby mitigating the adverse impacts of disasters and fostering recovery and reconstruction efforts in communities striving to rebuild their lives.',
            ),
            CollaboratorCard(
              name: 'DMC',
              description:
                  'The Disaster Management Center (DMC) of Sri Lanka stands as the apex governmental body dedicated to coordinating and executing comprehensive disaster preparedness, response, and recovery initiatives across the nation. Established to address the growing challenges posed by natural and man-made calamities, the DMC operates under the purview of the Ministry of Disaster Management. With its strategic framework grounded in risk reduction, mitigation, and swift response mechanisms, the DMC plays a pivotal role in safeguarding lives, infrastructure, and livelihoods, thereby fostering resilience and sustainable development throughout Sri Lanka.',
            ),
            ServiceCard(
              icon: Icons.local_hospital,
              title: 'Ambulance',
              onPressed: () {
                //action
              },
            ),
            ServiceCard(
              icon: Icons.phone,
              title: 'Calls',
              onPressed: () {},
            ),
            ServiceCard(
              icon: Icons.monetization_on,
              title: 'Money',
              onPressed: () {},
            ),
            ServiceCard(
              icon: Icons.local_offer,
              title: 'Insurance',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CollaboratorCard extends StatefulWidget {
  final String name;
  final String description;

  const CollaboratorCard({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  _CollaboratorCardState createState() => _CollaboratorCardState();
}

class _CollaboratorCardState extends State<CollaboratorCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.email),
                        label: Text('Email'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone),
                        label: Text('Call'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple.shade200,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
