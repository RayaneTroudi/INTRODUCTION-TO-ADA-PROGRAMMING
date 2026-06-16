with Ada.Text_IO; use Ada.Text_IO;
with Pricing; use Pricing;

procedure Main is
   S      : Float   := 100.0;
   K      : Float   := 105.0;
   N      : Integer := 10_000;
   Flag   : Boolean := True;
   result : Float   := Pricing.Add(A => 5.0, B => 5.0);
   Tab : Int_Array(1..5);
   Opt : Option_OOP := Make_Option (S => 100.0, T => 1.0);
   Call_Price : Float;
begin
   Put_Line("Spot = "  & Float'Image(S));
   Put_Line("Strike = " & Float'Image(K));
   Put_Line("a+b = " & Float'Image(result));
   Fill_Tab (Tab);
   Print_Tab(Tab);
   Put_Line("Spot Price = " & Float'Image(Opt.Get_Strike));
   Call_Price := Pricing.Monte_Carlo(S0 => 100.0, K => 90.0, T => 1.0, r => 0.02, sigma => 0.2, N_SIMS => 1000);
   Put_Line("Call_Price = " & Float'Image(Call_Price));
end Main;