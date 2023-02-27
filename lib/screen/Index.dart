import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/connection_bloc.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: BlocConsumer<ConnectionBloc, Connection_State>(
              buildWhen: (previous, current) => previous!=current,
              listener: (context, state) {
                if (state is ConnectionGain) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Now you are connected'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }else if (state is ConnectionLost) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You are not connected'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ConnectionGain) {
                  return const Text(
                    'Connected ',
                    style: TextStyle(fontSize: 30),
                  );
                } else if (state is ConnectionLost) {
                  return const Text(
                    'Not Connected ',
                    style: TextStyle(fontSize: 30),
                  );
                } else {
                  return const Text(
                    'Loading..',
                    style: TextStyle(fontSize: 30),
                  );
                }
              },
            ),
        )
    );
  }
}
/*
BlocBuilder<ConnectionBloc, ConnectionState>(
          builder: (context, state) {
            if (state is ConnectionLost){
              return const Text('Connected ', style: TextStyle(fontSize: 30),);
            }else if (state is ConnectionGain){
              return const Text('Not Connected ', style: TextStyle(fontSize: 30),);
            }else {
              return const Text('Loading..', style: TextStyle(fontSize: 30),);
            }
          },
          )



 BlocConsumer<ConnectionBloc, ConnectionState>(
        listener: (context, state) {
          if (state is ConnectionGain) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Now you are connected'),
                backgroundColor: Colors.green,
              ),
            );
          }else if (state is ConnectionLost) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are not connected'),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ConnectionLost) {
            return const Text(
              'Connected ',
              style: TextStyle(fontSize: 30),
            );
          } else if (state is ConnectionGain) {
            return const Text(
              'Not Connected ',
              style: TextStyle(fontSize: 30),
            );
          } else {
            return const Text(
              'Loading..',
              style: TextStyle(fontSize: 30),
            );
          }
        },
      ),

*/


