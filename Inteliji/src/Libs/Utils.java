package Libs;

public class Utils {
//    String host = "http://localhost:8080/Inteliji/";

    public static String fullPath(String path) {
        String fullPath ="http://localhost:8080/Inteliji/"+path;
        return fullPath;
    }
    public static String fullPathImg(String path) {
        String fullPath ="http://localhost:8080/Inteliji/Project%20Final/"+path;
        return fullPath;
    }

    public static String fullPathLibs(String path){
        String fullPath ="http://localhost:8080/Inteliji/Project%20Final/"+path;
        return fullPath;
    }

}
