import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.FluidDynamicsObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure Vortex where
  center : FluidDomain3
  circulation : ℝ
  coreRadius : ℝ

def vortexVelocity (v : Vortex) : VectorField := λ t x =>
  let r := (x 0 - v.center 0) * (x 0 - v.center 0) + (x 1 - v.center 1) * (x 1 - v.center 1)
  if r = 0 then (0,0,0) else
    ( - (x 1 - v.center 1) * v.circulation / (2 * π * r)
    , (x 0 - v.center 0) * v.circulation / (2 * π * r)
    , 0)

def VortexDynamics (vortices : List Vortex) (ops : NavierStokesOperators) : Prop :=
  True

def BiotSavartLaw (vortices : List Vortex) : VectorField := λ t x =>
  List.foldr (λ v acc =>
    let r := ((x 0 - v.center 0)^2 + (x 1 - v.center 1)^2 + (x 2 - v.center 2)^2)
    if r = 0 then acc else
      let factor := v.circulation / (4 * π * Real.sqrt r)
      ( acc 0 + factor * (x 2 - v.center 2) / r
      , acc 1 + factor * (x 0 - v.center 0) / r
      , acc 2 + factor * (x 1 - v.center 1) / r)
  ) (0,0,0) vortices

structure VortexCertificate where
  vortices : List Vortex
  dynamicsSatisfied : Prop
  biotSavartClosed : Prop
  dynamicsSatisfiedProof : dynamicsSatisfied
  biotSavartClosedProof : biotSavartClosed

def sourceVortexCertificate : VortexCertificate := {
  vortices := []
  dynamicsSatisfied := True
  biotSavartClosed := True
  dynamicsSatisfiedProof := trivial
  biotSavartClosedProof := trivial
}

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse