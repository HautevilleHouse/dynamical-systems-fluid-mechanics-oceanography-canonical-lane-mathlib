import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

abbrev ScalarField := Time → Space3 → ℝ

structure QGParameters where
  beta : ℝ
  f0 : ℝ
  rossbyRadius : ℝ
  topography : ScalarField

instance : Inhabited QGParameters where
  default :=
    { beta := 1.0
      f0 := 1.0
      rossbyRadius := 1.0
      topography := fun _ _ => 0 }

structure QGState where
  potentialVorticity : ScalarField
  streamFunction : ScalarField

instance : Inhabited QGState where
  default :=
    { potentialVorticity := fun _ _ => 0
      streamFunction := fun _ _ => 0 }

def QGEquation (state : QGState) (params : QGParameters) : Prop :=
  state.potentialVorticity = state.streamFunction

theorem qg_equation_trivial : QGEquation (default : QGState) default := by
  unfold QGEquation
  rfl

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse