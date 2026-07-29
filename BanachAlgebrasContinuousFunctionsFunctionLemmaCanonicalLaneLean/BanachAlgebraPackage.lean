import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure BanachAlgebra where
  carrier : Type u
  norm : carrier → ℝ
  algebraStruct : Algebra ℝ carrier
  normedAlgebra : NormedAlgebra ℝ carrier
  banach : CompleteSpace carrier

structure BanachAlgebraEvidence (B : BanachAlgebra) where
  normedAlgebraClosed : NormedAlgebra ℝ B.carrier
  banachClosed : CompleteSpace B.carrier

def BanachAlgebraClosed (B : BanachAlgebra) : Prop :=
  NormedAlgebra ℝ B.carrier ∧ CompleteSpace B.carrier

theorem banach_algebra_closed_from_evidence (B : BanachAlgebra) (E : BanachAlgebraEvidence B) :
    BanachAlgebraClosed B := by
  exact And.intro E.normedAlgebraClosed E.banachClosed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse