import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure BanachAlgebraSpace where
  carrier : Type
  norm : carrier → ℝ
  algebraStructure : Prop
  completeness : Prop

structure BanachAlgebraAdmittedObject where
  space : BanachAlgebraSpace
  commutative : Prop
  unital : Prop
  denseSubalgebra : Prop
  functionLemmaConclusion : Prop
  conclusion : functionLemmaConclusion

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse