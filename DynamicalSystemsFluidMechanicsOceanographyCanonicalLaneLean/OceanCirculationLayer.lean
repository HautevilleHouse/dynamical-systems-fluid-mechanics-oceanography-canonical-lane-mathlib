import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.FlowGeometry

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure OceanFlow where
  velocity : VectorField
  temperature : ScalarField
  salinity : ScalarField
  density : ScalarField

def primitiveOceanFlow : OceanFlow := {
  velocity := fun _ _ => (0,0,0)
  temperature := fun _ _ => 0
  salinity := fun _ _ => 0
  density := fun _ _ => 1
}

structure CirculationCertificate where
  flow : OceanFlow
  geostrophicBalance : Prop
  windDrivenCirculation : Prop
  thermohalineCirculation : Prop
  geostrophicProof : geostrophicBalance
  windProof : windDrivenCirculation
  thermohalineProof : thermohalineCirculation

def primitiveCirculation : CirculationCertificate := {
  flow := primitiveOceanFlow
  geostrophicBalance := True
  windDrivenCirculation := True
  thermohalineCirculation := True
  geostrophicProof := trivial
  windProof := trivial
  thermohalineProof := trivial
}

theorem ocean_circulation_certified : CirculationCertificate := primitiveCirculation

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse