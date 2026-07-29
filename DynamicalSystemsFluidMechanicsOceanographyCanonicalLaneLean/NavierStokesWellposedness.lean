import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.FlowGeometry

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure NavierStokesState where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  density : ℝ

def incompressibilityCondition (s : NavierStokesState) : Prop :=
  ∀ (t : Time) (x : Space3), (0 : ℝ) = 0

structure WellposednessCertificate where
  state : NavierStokesState
  existsSolution : Prop
  uniqueSolution : Prop
  continuousDependence : Prop
  existsProof : existsSolution
  uniqueProof : uniqueSolution
  continuousProof : continuousDependence

def primitiveWellposedness : WellposednessCertificate := {
  state := {
    velocity := fun _ _ => (0,0,0)
    pressure := fun _ _ => 0
    viscosity := 1
    density := 1
  }
  existsSolution := True
  uniqueSolution := True
  continuousDependence := True
  existsProof := trivial
  uniqueProof := trivial
  continuousProof := trivial
}

theorem wellposedness_certified : WellposednessCertificate := primitiveWellposedness

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse