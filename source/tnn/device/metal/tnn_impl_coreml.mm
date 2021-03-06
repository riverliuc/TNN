#include "tnn/device/metal/tnn_impl_coreml.h"
#include "tnn/core/instance.h"
#include "tnn/interpreter/abstract_model_interpreter.h"
#include "tnn/interpreter/net_structure.h"
#include "stdio.h"

namespace TNN_NS {

TNNImplFactoryRegister<TNNImplFactory<TNNImplCoreML>>
    g_tnn_impl_coreml_factory_register(MODEL_TYPE_COREML);
    
TNNImplCoreML::TNNImplCoreML() {
    
}
    
TNNImplCoreML::~TNNImplCoreML() {
}

Status TNNImplCoreML::Init(ModelConfig& config) {
    return TNNImpl::Init(config);
}

Status TNNImplCoreML::DeInit() {
//    coreml_model_ = nil;
    return TNN_OK;
}

Status TNNImplCoreML::AddOutput(const std::string& layer_name, int output_index) {
    return Status(TNNERR_MODEL_ERR, "Error: CoreML do not support adding output");
}

std::shared_ptr<Instance> TNNImplCoreML::CreateInst(NetworkConfig& net_config,
                                               Status& status,
                                               InputShapesMap inputs_shape) {
    auto instance = std::make_shared<Instance>(net_config, model_config_);
    status        = instance->Init(nullptr, inputs_shape);

    if (status != TNN_OK) {
        return nullptr;
    }
    return instance;
}
    
}  // namespace TNN_NS
