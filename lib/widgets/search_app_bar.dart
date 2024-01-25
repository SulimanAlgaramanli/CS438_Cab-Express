import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchAppBar extends StatefulWidget {
  const CustomSearchAppBar({
    super.key,
    this.isTextFieldEmpty = true,
    this.hideTextField = true,
    this.appBarTitle,
    this.onBackTap,
    this.onSearchTextTap,
    this.onSearchButtonTap,
    this.onCancelSearchTap,
    this.onTextSearchChanged,
    this.hintText,
    this.toolbarHeight,
    this.actionButton,
    this.onActionButtonTapped,
    this.textController,
    this.focusNode,
  });

  final FocusNode? focusNode;
  final Widget? appBarTitle;
  final void Function()? onBackTap;
  final void Function()? onCancelSearchTap;
  final void Function()? onSearchTextTap;
  final void Function()? onSearchButtonTap;
  final void Function()? onActionButtonTapped;
  final void Function(String)? onTextSearchChanged;
  final bool isTextFieldEmpty;
  final bool hideTextField;
  final String? hintText;
  final double? toolbarHeight;
  final Widget? actionButton;
  final TextEditingController? textController;

  @override
  State<CustomSearchAppBar> createState() => _CustomSearchAppBarState();
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
  bool get isTextFieldEmpty => widget.isTextFieldEmpty;

  bool get hideTextField => widget.hideTextField;

  String? get hintText => widget.hintText;

  double? get toolbarHeight => widget.toolbarHeight;

  Widget? get actionButton => widget.actionButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      leading: _buildLeadingButton(),
      title: _showTextField(),
      actions: [
        if (hideTextField)
          IconButton(
            onPressed: widget.onSearchButtonTap,
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        actionButton ??
            IconButton(
              onPressed: widget.onActionButtonTapped,
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
            )
      ],
      toolbarHeight: toolbarHeight,
    );
  }

  Widget _showTextField() {
    return hideTextField
        ? widget.appBarTitle ?? const SizedBox.shrink()
        : TextField(
            controller: widget.textController,
            scrollPadding: EdgeInsets.zero,
            maxLength: 55,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.width / 26,
              ),
              counterText: '',
              hintMaxLines: 1,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: widget.onCancelSearchTap,
                icon: const Icon(Icons.close_rounded),
              ),
              hintText: hintText,
              hintStyle:
                  context.textTheme.labelLarge?.copyWith(color: Colors.grey),
            ),
            focusNode: widget.focusNode,
            onChanged: widget.onTextSearchChanged,
          );
  }

  Widget _buildLeadingButton() {
    return isTextFieldEmpty
        ? BackButton(
            color: Colors.white,
            onPressed: widget.onBackTap,
          )
        : IconButton(
            onPressed: widget.onSearchTextTap,
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          );
  }
}
