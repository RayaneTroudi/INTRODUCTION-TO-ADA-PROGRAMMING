with Ada.Text_IO; use Ada.Text_IO;

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

end Pricing;