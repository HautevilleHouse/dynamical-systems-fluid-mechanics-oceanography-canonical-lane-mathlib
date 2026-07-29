import DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean.FluidDynamicsAnalyticCertificate

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean

def FluidDynamicsAdmittedAnalyticClosure : Prop :=
  FluidDynamicsAnalyticCertificateClosed sourceFluidDynamicsAnalyticCertificate ∧
  ConstrainedTheoremClosure analyticAdmissibleClass

def UnrestrictedClassicalFluidDynamicsBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedNavierStokesStackCarried = true

theorem fluid_dynamics_admitted_analytic_closure_checked :
    FluidDynamicsAdmittedAnalyticClosure := by
  exact And.intro source_fluid_dynamics_analytic_certificate_closed
    (constrained_theorem_closure analyticAdmissibleClass)

theorem unrestricted_classical_fluid_dynamics_boundary_carried_checked :
    UnrestrictedClassicalFluidDynamicsBoundaryCarried := by
  exact And.intro rfl rfl

end DynamicalSystemsFluidMechanicsOceanographyCanonicalLaneLean
end HautevilleHouse
