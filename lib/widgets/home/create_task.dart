import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheet_holder.dart';
import 'package:tasks/widgets/home/sheet_goto_calendar.dart';
import 'package:tasks/widgets/Forms/form_input_unlabelled.dart';
import 'package:tasks/widgets/text_outlined_button.dart';

// ignore: must_be_immutable
class CreateTaskBottomSheet extends StatelessWidget {
  CreateTaskBottomSheet({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      SheetGoToCalendarWidget(
                        cardBackgroundColor: HexColor.fromHex("7DBA67"),
                        textAccentColor: HexColor.fromHex("A9F49C"),
                        value: 'Today 3:00PM',
                        label: 'Fecha',
                      ),
                      _buildDropdownPriority(),
                    ]),
                // Spacer(),
                AppSpaces.verticalSpace20,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: OutlinedButtonWithText(
                      width: 250,
                      content: "Crear Tarea",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
        Expanded(
          child: UnlabelledFormInput(
            placeholder: "Task Name ....",
            autofocus: true,
            keyboardType: "text",
            controller: _nameController,
            obscureText: false,
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
    final priorities = TaskPriority.values.map((e) => e.name).toList();

    return SizedBox(
      width: 100,
      child: DropdownButtonFormField(
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
                  priority,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {},
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
