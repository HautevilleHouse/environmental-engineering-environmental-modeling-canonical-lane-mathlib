import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure BiogeochemicalCyclesPackage where
  carbonCycleModel : Prop
  nitrogenCycleModel : Prop
  phosphorusCycleModel : Prop
  microbialMediation : Prop
  redoxReactions : Prop

structure BiogeochemicalCyclesEvidence (B : BiogeochemicalCyclesPackage) where
  carbonCycleModelClosed : B.carbonCycleModel
  nitrogenCycleModelClosed : B.nitrogenCycleModel
  phosphorusCycleModelClosed : B.phosphorusCycleModel
  microbialMediationClosed : B.microbialMediation
  redoxReactionsClosed : B.redoxReactions

def BiogeochemicalCyclesClosed (B : BiogeochemicalCyclesPackage) : Prop :=
  B.carbonCycleModel ∧ B.nitrogenCycleModel ∧ B.phosphorusCycleModel ∧
  B.microbialMediation ∧ B.redoxReactions

theorem biogeochemical_cycles_closed_from_evidence
    (B : BiogeochemicalCyclesPackage) (E : BiogeochemicalCyclesEvidence B) :
    BiogeochemicalCyclesClosed B := by
  exact And.intro E.carbonCycleModelClosed
    (And.intro E.nitrogenCycleModelClosed
      (And.intro E.phosphorusCycleModelClosed
        (And.intro E.microbialMediationClosed E.redoxReactionsClosed)))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse