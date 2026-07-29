import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

abbrev FluidDomain3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → FluidDomain3 → ℝ
abbrev VectorField := Time → FluidDomain3 → FluidDomain3

structure FluidFlow where
  velocity : VectorField
  pressure : ScalarField
  density : ScalarField
  viscosity : ℝ

structure NavierStokesOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  materialDerivative : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def incompressible (F : FluidFlow) (ops : NavierStokesOperators) : Prop :=
  ops.divergence F.velocity = λ _ _ => 0

def navierStokesEquation (F : FluidFlow) (ops : NavierStokesOperators) : Prop :=
  ops.materialDerivative F.velocity = ops.laplacian F.velocity

def FluidEquationClosed (F : FluidFlow) (ops : NavierStokesOperators) : Prop :=
  incompressible F ops ∧ navierStokesEquation F ops

def zeroScalarField : ScalarField := λ _ _ => 0
def zeroVectorField : VectorField := λ _ _ _ => 0

def primitiveOperators : NavierStokesOperators := {
  divergence := λ u => zeroScalarField
  gradient := λ s => zeroVectorField
  laplacian := λ u => u
  materialDerivative := λ _ => zeroVectorField
  pressureProjection := λ u => u
  pressureProjectionIdempotent := by intro u; rfl
}

def primitiveFlow : FluidFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  density := zeroScalarField
  viscosity := 1
}

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse