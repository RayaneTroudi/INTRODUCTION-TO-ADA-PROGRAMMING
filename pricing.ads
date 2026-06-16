-- pricing.ads (spec = déclarations)
package Pricing is

   type Int_Array is array (Integer range <>) of Integer;

   type Option_OOP is tagged private;

   function Make_Option(S,T : Float) return Option_OOP; 
   function Get_Strike(Opt : Option_OOP) return Float; 
   function Get_Maturity(Opt : Option_OOP) return Float;
   function Pay_Off(S,K : Float) return Float;
   function Monte_Carlo(S0,K,T,r,sigma : Float; N_SIMS:Integer) return Float;

   function Add (A, B : Float) return Float;
   procedure Fill_Tab (Tab : in out Int_Array);
   procedure Print_Tab (Tab : Int_Array);

   private 

      type Option_OOP is tagged record
         Strike : Float;
         Maturity : Float;
      end record;

end Pricing;

