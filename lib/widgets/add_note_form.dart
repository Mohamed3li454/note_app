import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list_view.dart';
import 'package:note_app/widgets/custom_add_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class FormBody extends StatefulWidget {
  const FormBody({
    super.key,
  });

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Custom_TextFiald(
            hint: "Title",
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Custom_TextFiald(
            onsaved: (value) {
              subtitle = value;
            },
            hint: "Content",
            maxlints: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomAddButton(
                isloading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    var date = DateTime.now();
                    var formatdate = DateFormat.yMMMd().format(date);
                    formkey.currentState!.save();
                    var notemodel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatdate,
                        color: Colors.black.value);
                    BlocProvider.of<AddNotesCubit>(context).addnotes(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
