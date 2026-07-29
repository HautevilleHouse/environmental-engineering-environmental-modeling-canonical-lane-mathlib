import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure SoilGroundwaterPackage where
  unsaturatedFlow : Prop
  saturatedFlow : Prop
  contaminantTransport : Prop
  biodegradationModel : Prop

structure SoilGroundwaterEvidence (P : SoilGroundwaterPackage) where
  unsaturatedFlowClosed : P.unsaturatedFlow
  saturatedFlowClosed : P.saturatedFlow
  contaminantTransportClosed : P.contaminantTransport
  biodegradationModelClosed : P.biodegradationModel

def SoilGroundwaterClosed (P : SoilGroundwaterPackage) : Prop :=
  P.unsaturatedFlow ∧ P.saturatedFlow ∧ P.contaminantTransport ∧ P.biodegradationModel

theorem soil_groundwater_closed_from_evidence (P : SoilGroundwaterPackage)
    (E : SoilGroundwaterEvidence P) : SoilGroundwaterClosed P := by
  exact And.intro E.unsaturatedFlowClosed
    (And.intro E.saturatedFlowClosed
      (And.intro E.contaminantTransportClosed E.biodegradationModelClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse