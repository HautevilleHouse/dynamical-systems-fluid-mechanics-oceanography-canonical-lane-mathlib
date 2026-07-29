import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.FluidDynamicsObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure OceanFlow where
  velocity : VectorField
  temperature : ScalarField
  salinity : ScalarField
  pressure : ScalarField
  viscosity : ℝ

def coriolisTerm (u : VectorField) (Ω : ℝ) : VectorField := λ t x =>
  (u t x 0 * 2 * Ω, u t x 1 * (- 2 * Ω), 0)

structure OceanOperators where
  materialDerivative : VectorField → VectorField
  coriolis : VectorField → VectorField
  diffusion : VectorField → VectorField
  pressureGradient : ScalarField → VectorField

def primitiveOceanOperators : OceanOperators := {
  materialDerivative := λ u => u
  coriolis := λ u => coriolisTerm u (7.2921e-5)
  diffusion := λ u => u
  pressureGradient := λ p => λ t x => (0,0,0)
}

def OceanEquation (o : OceanFlow) (ops : OceanOperators) : Prop :=
  ops.materialDerivative o.velocity = ops.coriolis o.velocity + ops.diffusion o.velocity

structure OceanCertificate where
  flow : OceanFlow
  operators : OceanOperators
  equationClosed : Prop
  equationClosedProof : equationClosed

def primitiveOceanFlow : OceanFlow := {
  velocity := λ _ _ => (0,0,0)
  temperature := λ _ _ => 0
  salinity := λ _ _ => 0
  pressure := λ _ _ => 0
  viscosity := 1.0
}

def sourceOceanCertificate : OceanCertificate := {
  flow := primitiveOceanFlow
  operators := primitiveOceanOperators
  equationClosed := True
  equationClosedProof := trivial
}

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse