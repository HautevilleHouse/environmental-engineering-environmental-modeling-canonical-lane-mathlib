import EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure AdmissibleClass where
  object : EnvironmentalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EnvironmentalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse
