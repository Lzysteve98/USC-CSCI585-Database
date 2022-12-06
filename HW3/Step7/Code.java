public class Code {
   public static void main(String[] args) {
      double R = 6;
      double r = 1;
      int a = 8;
      double x;
      double y;
      double t = 0.00;
      while (t < (20 * Math.PI)) {
         x = (R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t);
         y = (R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t);
         System.out.println((-118.28544359531807 + 0.0001 * y) + "," + (34.020582050672985 + 0.0001 * x) + ",0.");
         t += 0.01;
      }
   }
}
