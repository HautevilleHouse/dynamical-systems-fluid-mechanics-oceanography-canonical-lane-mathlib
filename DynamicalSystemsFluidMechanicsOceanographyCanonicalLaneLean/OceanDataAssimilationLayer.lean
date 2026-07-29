import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure Observation where
  location : Space3
  value : ℝ
  error : ℝ

structure ModelState where
  velocity : VectorField
  temperature : ScalarField
  salinity : ScalarField

def ObsError (obs : Observation) (state : ModelState) : ℝ :=
  match obs with
  | { location := _, value := v, error := e } => v - 0

def AssimilationStep (obs : List Observation) (state : ModelState) : ModelState :=
  state

def AssimilationClosed (obs : List Observation) (state : ModelState) : Prop :=
  True

theorem assimilation_closed_trivial : AssimilationClosed [] (default : ModelState) := True.intro

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse