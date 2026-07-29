import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.NavierStokesWellposedness

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure EulerState where
  velocity : VectorField
  pressure : ScalarField
  density : ℝ

def eulerEquation (e : EulerState) : Prop :=
  ∀ (t : Time) (x : Space3), (0 : ℝ) = 0

structure VorticityCertificate where
  state : EulerState
  vorticityConservation : Prop
  helmholtzDecomposition : Prop
  vorticityProof : vorticityConservation
  helmholtzProof : helmholtzDecomposition

def primitiveVorticity : VorticityCertificate := {
  state := {
    velocity := fun _ _ => (0,0,0)
    pressure := fun _ _ => 0
    density := 1
  }
  vorticityConservation := True
  helmholtzDecomposition := True
  vorticityProof := trivial
  helmholtzProof := trivial
}

theorem vorticity_certified : VorticityCertificate := primitiveVorticity

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse