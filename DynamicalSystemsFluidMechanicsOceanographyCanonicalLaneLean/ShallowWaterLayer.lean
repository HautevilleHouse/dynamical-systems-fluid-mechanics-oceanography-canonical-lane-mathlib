import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure SWParameters where
  gravity : ℝ
  coriolis : ℝ
  bottomTopography : ScalarField

default SWParameters where
  gravity := 9.81
  coriolis := 0.0001
  bottomTopography := fun _ _ => 0

structure SWState where
  height : ScalarField
  velocity : VectorField

def SWConservation (state : SWState) (params : SWParameters) : Prop :=
  state.height = zeroScalarField

theorem sw_conservation_trivial : SWConservation (default : SWState) default := by
  unfold SWConservation
  simp

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse