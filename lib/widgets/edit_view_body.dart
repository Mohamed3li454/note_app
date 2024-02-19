import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/consts.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list_view.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, subtitle;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            custom_appbar(
              onpressed: () {
                if (formkey.currentState!.validate()) {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).ReadNotes();
                  Navigator.pop(context);
                  EditAddNoteSuccessSnackbar.show(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              title: "Edit Note",
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            Custom_TextFiald(
              text: widget.note.title,
              hint: "",
              onchanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Custom_TextFiald(
              text: widget.note.subtitle,
              hint: "",
              maxlints: 5,
              onchanged: (value) {
                subtitle = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            EditColorItim(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}

class EditColorItim extends StatefulWidget {
  const EditColorItim({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditColorItim> createState() => _EditColorItimState();
}

class _EditColorItimState extends State<EditColorItim> {
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  late int currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = colors[index].value;
                setState(() {});
              },
              child: ColorItem(
                  isActive: currentIndex == index, color: colors[index]),
            ),
          );
        },
      ),
    );
  }
}

class EditAddNoteSuccessSnackbar {
  static void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Edit Note successfully'),
          ],
        ),
        backgroundColor: Colors.black87,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
