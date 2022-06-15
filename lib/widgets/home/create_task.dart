import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/screens/screens.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheet_holder.dart';
import 'package:tasks/widgets/home/sheet_goto_calendar.dart';
import 'package:tasks/widgets/Forms/form_input_unlabelled.dart';
import 'package:tasks/widgets/tasks/select_color.dart';
import 'package:tasks/widgets/text_outlined_button.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CreateTaskBottomSheet extends StatelessWidget {
  CreateTaskBottomSheet({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskPriority _taskPriority = TaskPriority.low;
  DateTime? dateTime;
  final ValueNotifier<DateTime?> _dateNotifier = ValueNotifier(null);
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<Color> _colorNotifier = ValueNotifier(Colors.deepPurple);

  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);

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
                    // SheetGoToCalendarWidget(
                    //   cardBackgroundColor: HexColor.fromHex("7DBA67"),
                    //   textAccentColor: HexColor.fromHex("A9F49C"),
                    //   value: 'Today 3:00PM',
                    //   label: 'Fecha',
                    // ),
                    _buildSelectDate(context: context, dateTime: dateTime),
                    _buildDropdownPriority(),
                  ],
                ),
                AppSpaces.verticalSpace20,
                _buildSelectedColor(context),
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
                              hexColor: _color.value.toRadixString(16),
                              dateTime: dateTime,
                            )),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //       width: Utils.screenWidth * 0.6,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           const BottomSheetIcon(
                  //               icon: Icons.local_offer_outlined),
                  //           Transform.rotate(
                  //               angle: 195.2,
                  //               child: const BottomSheetIcon(
                  //                   icon: Icons.attach_file)),
                  //           const BottomSheetIcon(icon: FeatherIcons.flag),
                  //           const BottomSheetIcon(icon: FeatherIcons.image)
                  //         ],
                  //       ),
                  //     ),
                  //     AddSubIcon(
                  //       scale: 0.8,
                  //       color: AppColors.primaryAccentColor,
                  //       callback: () => _addProject,
                  //     ),
                  //   ],
                  // )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedColor(BuildContext context) {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularColorCard(
            notifier: _colorNotifier,
          ),
          AppSpaces.horizontalSpace10,
          Text(
            'Color',
            style: GoogleFonts.lato(
                fontSize: 16, color: HexColor.fromHex("626777")),
          ),
        ],
      ),
      onTap: () => openColorPicker(context, (value) {
        _color = value;
        _colorNotifier.value = value;
        print(value);
      }),
    );
  }

  Widget _buildSelectDate({
    required BuildContext context,
    DateTime? dateTime,
  }) {
    return InkWell(
      onTap: () async {
        final date = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TaskDueDateScreen()),
        );

        _dateNotifier.value = date;
        // dateTime = await Navigator.pushNamed(
        //     context, TaskDueDateScreen.routeName);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularCalendarCard(color: HexColor.fromHex("7DBA67")),
          AppSpaces.horizontalSpace10,
          CircularCardLabel(
            notifier: _dateNotifier,
            label: 'Fecha',
            value: dateTime == null
                ? '_______'
                : DateFormat('dd/MM/y').format(dateTime),
            color: HexColor.fromHex("A9F49C"),
          )
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [HexColor.fromHex("FD916E"), HexColor.fromHex("FFE09B")],
            ),
          ),
        ),
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
            placeholder: "Task Description ....",
            autofocus: true,
            keyboardType: "text",
            controller: _descriptionController,
            obscureText: false,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownPriority() {
    final priorities = TaskPriority.values.map((e) => e).toList();

    return SizedBox(
      width: 100,
      child: DropdownButtonFormField<TaskPriority>(
        iconSize: 20,
        dropdownColor: AppColors.primaryBackgroundColor,
        iconEnabledColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Prioridad',
          hintStyle: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        items: priorities
            .map(
              (priority) => DropdownMenuItem(
                value: priority,
                child: Text(
                  priority.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          _taskPriority = value!;
        },
      ),
    );
  }
}

class BottomSheetIcon extends StatelessWidget {
  final IconData icon;
  const BottomSheetIcon({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      iconSize: 32,
      onPressed: null,
    );
  }
}
