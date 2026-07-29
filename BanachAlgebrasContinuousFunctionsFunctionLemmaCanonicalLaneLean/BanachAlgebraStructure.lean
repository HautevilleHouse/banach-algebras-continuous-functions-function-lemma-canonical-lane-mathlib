import BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.BanachAlgebraObjects

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure BanachAlgebraPackage where
  space : BanachAlgebraSpace
  normedAlgebra : Prop
  completeness : Prop
  normedAlgebraClosed : normedAlgebra
  completenessClosed : completeness

structure BanachAlgebraEvidence (P : BanachAlgebraPackage) where
  normedAlgebraClosed : P.normedAlgebra
  completenessClosed : P.completeness

def BanachAlgebraClosed (P : BanachAlgebraPackage) : Prop :=
  P.normedAlgebra ∧ P.completeness

theorem banach_algebra_closed_from_evidence (P : BanachAlgebraPackage) (E : BanachAlgebraEvidence P) : BanachAlgebraClosed P := by
  exact And.intro E.normedAlgebraClosed E.completenessClosed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse