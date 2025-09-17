var exec = require('cordova/exec');

var IonicSceneDelegate = {
    
    isSceneDelegateActive: function(successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'CDVSceneDelegate', 'isSceneDelegateActive', []);
    },
    
    handleDeepLink: function(url, successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'CDVSceneDelegate', 'handleDeepLink', [url]);
    },
    
    getSceneState: function(successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'CDVSceneDelegate', 'getSceneState', []);
    }
};

// Exportación para diferentes entornos
if (typeof module !== 'undefined' && module.exports) {
    module.exports = IonicSceneDelegate;
}

if (typeof window !== 'undefined') {
    window.IonicSceneDelegate = IonicSceneDelegate;
}