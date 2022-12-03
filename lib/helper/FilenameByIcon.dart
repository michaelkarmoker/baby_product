import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class FileNameByIcon {
  static IconData getIconByFileName(String? fileName) {
     List<String> fileType=fileName!.split(".");
     if(fileType[1]=="pdf"){
       return Icons.picture_as_pdf_outlined;
     }else if(fileType[1]=="jpg"||fileType[1]=="png"||fileType[1]=="jpeg"){
       return Icons.image_outlined;
     }else if(fileType[1]=="doc"){
       return Icons.file_copy_outlined;
     }else{
       return Icons.file_copy_outlined;
     }
  }

/*static Future<File> createUniqueFile(
      String folderName, final String? name) async {
    File uniqueFile = FileUtil.getUniqueFile(folderName, name);
    if (!uniqueFile.existsSync()) {
      await uniqueFile.create();
    }
    return uniqueFile;
  }*/
}