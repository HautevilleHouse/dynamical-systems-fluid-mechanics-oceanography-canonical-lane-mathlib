import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure Stratification where
  temperatureGradient : ScalarField
  salinityGradient : ScalarField
  bruntVaisalaFrequency : ℝ

instance : Inhabited Stratification where
  default :=
    { temperatureGradient := fun _ _ => 0
      salinityGradient := fun _ _ => 0
      bruntVaisalaFrequency := 0.01 }

def InternalWaveEquation (S : Stratification) : Prop :=
  S.bruntVaisalaFrequency > 0

structure StratifiedFlow where
  velocity : VectorField
  density : ScalarField
  stratification : Stratification

instance : Inhabited StratifiedFlow where
  default :=
    { velocity := fun _ _ => (0, 0, 0)
      density := fun _ _ => 0
      stratification := default }

def InternalWaveClosed (F : StratifiedFlow) : Prop :=
  F.density = zeroScalarField ∧ InternalWaveEquation F.stratification

theorem internal_wave_closed_trivial : InternalWaveClosed (default : StratifiedFlow) := by
  unfold InternalWaveClosed InternalWaveEquation
  constructor
  · rfl
  · norm_num

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse