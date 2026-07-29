import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure FluidDomain where
  domainType : String
  boundaryType : String
  depthProfile : ℝ → ℝ
  coriolisParameter : ℝ → ℝ

def oceanSurface : ScalarField := fun _ _ => 0

def primitiveCoriolis : ℝ → ℝ := fun φ => 2 * Real.sin φ

structure FlowGeometry where
  spatialDimension : ℕ
  manifold : String
  metric : String

def euclideanGeometry : FlowGeometry := {
  spatialDimension := 3
  manifold := "Euclidean"
  metric := "flat"
}

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse