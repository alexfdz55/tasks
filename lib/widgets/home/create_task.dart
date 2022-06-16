import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheet_holder.dart';
import 'package:tasks/widgets/Forms/form_input_unlabelled.dart';
import 'package:tasks/widgets/tasks/select_color.dart';
import 'package:tasks/widgets/tasks/select_date_and_hour.dart';
import 'package:tasks/widgets/tasks/select_priority.dart';
import 'package:tasks/widgets/text_outlined_button.dart';

// ignore: must_be_immutable
class CreateTaskBottomSheet extends StatelessWidget {
  CreateTaskBottomSheet({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskPriority _taskPriority = TaskPriority.low;
  DateTime? _date;
  String _hexColor = '673ab7';

  @override
  Widget build(BuildContext context) {
    // final taskBloc = BlocProvider.of<TaskBloc>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          AppSpaces.verticalSpace10,
          const BottomSheetHolder(),
          AppSpaces.verticalSpace10,
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpaces.verticalSpace20,
                _buildNameField(),
                AppSpaces.verticalSpace20,
                _buildDescriptionField(),
                AppSpaces.verticalSpace20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectDateAndHour(onChanged: (date) => _date = date),
                    SelectPriority(
                        onChanged: (priority) => _taskPriority = priority!),
                  ],
                ),
                AppSpaces.verticalSpace20,
                SelectColor(onChanged: (color) => _hexColor = color),
                // Spacer(),
                AppSpaces.verticalSpace20,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: OutlinedButtonWithText(
                      width: 250,
                      content: "Crear Tarea",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<TaskBloc>(context).add(
                            AddTask(Task(
                              id: DateTime.now().toString(),
                              title: _nameController.text,
                              description: _descriptionController.text,
                              priority: _taskPriority,
                              hexColor: _hexColor,
                              dateTime: _date,
                            )),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Row(
      children: [
        const Icon(Icons.title, color: Colors.white),
        // Container(
        //   width: 20,
        //   height: 20,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5),
        //     gradient: LinearGradient(
        //       colors: [HexColor.fromHex("FD916E"), HexColor.fromHex("FFE09B")],
        //     ),
        //   ),
        // ),
        AppSpaces.horizontalSpace20,
        Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Expanded(
            child: UnlabelledFormInput(
              placeholder: "Nombre",
              autofocus: true,
              keyboardType: "text",
              controller: _nameController,
              obscureText: false,
              textValidation: 'Nombre requerido',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese un nombre';
                }
                return null; // Válido
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Row(
      children: [
        const Icon(Icons.description, color: Colors.white),
        AppSpaces.horizontalSpace20,
        Expanded(
          child: UnlabelledFormInput(
            placeholder: "Descripción",
            autofocus: true,
            keyboardType: "text",
            controller: _descriptionController,
            obscureText: false,
          ),
        ),
      ],
    );
  }
}
