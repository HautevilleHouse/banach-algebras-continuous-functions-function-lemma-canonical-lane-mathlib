import Mathlib.Topology.Basic
import Mathlib.Algebra.Algebra.Basic

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure BanachAlgebraSpace where
  carrier : Type u
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier
  normedRing : NormedRing carrier
  normedAlgebra : NormedAlgebra ℝ carrier
  complete : CompleteSpace carrier

structure BanachAlgebraAdmittedObject where
  space : BanachAlgebraSpace
  commutative : Prop
  unital : Prop
  gelfandTransformIsIsometric : Prop
  conclusion : gelfandTransformIsIsometric

def BanachAlgebraWitnessClosed (O : BanachAlgebraAdmittedObject) : Prop :=
  O.gelfandTransformIsIsometric

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse