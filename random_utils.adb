with Ada.Numerics.Float_Random;
with Ada.Numerics.Elementary_Functions;

package body Random_Utils is

   use Ada.Numerics.Elementary_Functions;

   package FR renames Ada.Numerics.Float_Random;
   Gen : FR.Generator;

   procedure Reset is
   begin
      FR.Reset (Gen);
   end Reset;

   function Uniform return Float is
   begin
      return FR.Random (Gen);
   end Uniform;

   function Normal (Mu : Float := 0.0; Sigma : Float := 1.0) return Float is
      U1, U2 : Float;
      Z       : Float;
   begin
      U1 := FR.Random (Gen);
      U2 := FR.Random (Gen);
      Z  := Sqrt (-2.0 * Log (U1)) * Cos (2.0 * Ada.Numerics.Pi * U2);
      return Mu + Sigma * Z;
   end Normal;

end Random_Utils;