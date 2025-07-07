mod consts;
use consts::{alpha, mds, round_constants, presparse_mds, sparse_mds};

use crate::poseidon::{config, permute, PoseidonConfig};

pub fn stark_config() -> PoseidonConfig<3, 273, 415> {
    config(
        3,               
        8,              
        83,             
        alpha(),
        round_constants(),
        mds(),
        presparse_mds(),  
        sparse_mds(),    
    )
}

pub fn hash2(a: Field, b: Field) -> Field {
    permute(stark_config(), [a, b, 0])[0]
}
pub fn hash1(a: Field) -> Field {
    permute(stark_config(), [a, 0, 0])[0]
}
