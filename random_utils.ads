package Random_Utils is

   procedure Reset;
   function Uniform return Float;
   function Normal (Mu : Float := 0.0; Sigma : Float := 1.0) return Float;

end Random_Utils;