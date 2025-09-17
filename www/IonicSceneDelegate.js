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
    },
    
    // Eventos para suscribirse a cambios de estado
    onSceneDidBecomeActive: function(callback) {
        document.addEventListener('resume', callback, false);
    },
    
    onSceneWillResignActive: function(callback) {
        document.addEventListener('pause', callback, false);
    }
};

// Exportar para CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = IonicSceneDelegate;
}

// Exportar globalmente para navegador
if (typeof window !== 'undefined') {
    window.IonicSceneDelegate = IonicSceneDelegate;
}