//
//  wikiWebView.swift
//  grocies-app
//
//  Created by Fauzan Ghozi Mubarak on 03/11/23.
//

import SwiftUI
import WebKit

struct WikiWebView: View {
    @State  var urlString : String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            WebView(urlString: $urlString)
            
        }
//        .overlay(backButton,alignment: .topLeading)
        .ignoresSafeArea()
    }
}

struct wikiWebView_Previews: PreviewProvider {
    static var previews: some View {
        WikiWebView(urlString: "")
    }
}


extension WikiWebView{
    
    private var backButton : some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
        
    }
}
struct WebView: UIViewRepresentable {
    @Binding var urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        // Anda dapat menambahkan logika untuk menangani peristiwa navigasi web di sini jika diperlukan.
    }
}
