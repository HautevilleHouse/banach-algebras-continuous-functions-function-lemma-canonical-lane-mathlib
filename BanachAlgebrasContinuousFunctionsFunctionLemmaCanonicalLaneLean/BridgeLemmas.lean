import BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.functionLemmaConclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse