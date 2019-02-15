package com.tqy.cams.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {
	
	public static byte[] getContent(String filePath) throws IOException {
        File file = new File(filePath);
        long fileSize = file.length();
        if (fileSize > Integer.MAX_VALUE) {
            System.out.println("file too big...");
            return null;
        }
        FileInputStream fi = new FileInputStream(file);
        byte[] buffer = new byte[(int) fileSize];
        int offset = 0;
        int numRead = 0;
        while (offset < buffer.length
        && (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
            offset += numRead;
        }
        // 确保所有数据均被读取
        if (offset != buffer.length) {
        	throw new IOException("Could not completely read file " + file.getName());
        }
        fi.close();
        return buffer;
    }

	public static boolean writeFile(byte[] content, String path) {
		FileOutputStream fop = null;
		File file = new File(path+"/附件");
		try {
		   fop = new FileOutputStream(file);
		   // if file doesnt exists, then create it
		   if (!file.exists()) {
			   file.createNewFile();
		   }
		   //写入文件
		   fop.write(content);
		   fop.flush();
		   fop.close();
		  } catch (IOException e) {
			  e.printStackTrace();
			  return false;
		  } finally {
			  try {
			    if (fop != null) {
			     fop.close();
			    }
			  } catch (IOException e) {
			    e.printStackTrace();
			  }
		 }
		return true;
	}
}
