with Ada.Text_IO; use Ada.Text_IO;
with Random_Utils; use Random_Utils;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;


package body Pricing is

   function Add (A, B : Float) return Float is
   begin
      return A + B;
   end Add;

   procedure Fill_Tab (Tab : in out Int_Array) is
   begin
      for I in Tab'Range loop
         Tab(I) := I;
      end loop;
   end Fill_Tab;

   procedure Print_Tab(Tab : Int_Array) is
   begin
      For I in Tab'Range loop
         Put_Line(Integer'Image(Tab(I)));
      end loop;
   end Print_Tab;


   function Get_Strike (Opt : Option_OOP) return Float is
   begin 
      return Opt.Strike; 
   end Get_Strike;


   function Get_Maturity (Opt : Option_OOP) return Float is
   begin 
      return Opt.Maturity; 
   end Get_Maturity;


   function Make_Option (S, T : Float) return Option_OOP is
   begin
      return (Strike => S, Maturity => T);
   end Make_Option;

   function Pay_Off (S, K : Float) return Float is
   begin
      return Float'Max (S - K, 0.0);
   end Pay_Off;

   function Monte_Carlo(S0,K,T,r,sigma : Float ; N_SIMS : Integer) return Float is

      sum : Float := 0.0;
      S_T : Float;

   begin

      for I in 1..N_SIMS
      loop 
         S_T :=  S0 * Exp( (r - 0.5*sigma**2)*T + sigma*sqrt(T)*Normal(Mu => 0.0, Sigma => 1.0) );
         sum := sum + Pay_Off(S => S_T, K => K);
      end loop;

      return Exp(-r*T) * (1.0/ Float (N_SIMS)) * sum;
      
   end Monte_Carlo;

end Pricing;