#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(DataProvider, RCTEventEmitter)

RCT_EXTERN_METHOD(start)
RCT_EXTERN_METHOD(stop)

// This is needed so the timer runs correctly
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

@end
