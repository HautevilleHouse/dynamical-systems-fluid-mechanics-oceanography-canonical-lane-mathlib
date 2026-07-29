import DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.RegularityEndpointLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

structure FluidDynamicsAnalyticCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  energyLayerClosed : Prop
  compactnessLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  energyLayerClosedProof : energyLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceFluidDynamicsAnalyticCertificate : FluidDynamicsAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := NavierStokesEquationClosed primitiveFlow
  weakLayerClosed := LerayHopfEnvelopeClosed sourceLerayHopfEnvelope
  energyLayerClosed := EnergyEnstrophyClosed sourceEnergyEnstrophyCertificate
  compactnessLayerClosed := CompactnessRigidityClosed sourceCompactnessRigidityCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := commonCoreProjectionLawAvailable ∧ commonCoreCarriageLawAvailable ∧ commonCoreIdempotenceAvailable
  operatorsClosedProof := primitive_flow_equation_closed_checked
  weakLayerClosedProof := source_leray_hopf_envelope_closed
  energyLayerClosedProof := source_energy_enstrophy_closed
  compactnessLayerClosedProof := source_compactness_rigidity_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := And.intro mathlib_common_core_projection_law_checked
    (And.intro mathlib_common_core_carriage_law_checked mathlib_common_core_idempotence_checked)
}

def FluidDynamicsAnalyticCertificateClosed (C : FluidDynamicsAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.energyLayerClosed ∧
  C.compactnessLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_fluid_dynamics_analytic_certificate_closed :
    FluidDynamicsAnalyticCertificateClosed sourceFluidDynamicsAnalyticCertificate := by
  exact And.intro sourceFluidDynamicsAnalyticCertificate.operatorsClosedProof
    (And.intro sourceFluidDynamicsAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceFluidDynamicsAnalyticCertificate.energyLayerClosedProof
        (And.intro sourceFluidDynamicsAnalyticCertificate.compactnessLayerClosedProof
          (And.intro sourceFluidDynamicsAnalyticCertificate.endpointLayerClosedProof
            sourceFluidDynamicsAnalyticCertificate.canonicalCarriageImportedProof))))

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse
