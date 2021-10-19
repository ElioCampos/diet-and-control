import 'package:web_socket_channel/web_socket_channel.dart';

class ChannelProvider{
  String _url = "wss://diet-and-control.herokuapp.com/ws/chat";
  late WebSocketChannel _channel;
  ChannelProvider(int chatId){
    _channel = WebSocketChannel.connect(Uri.parse('$_url/$chatId'));
  }
  WebSocketChannel get channel => _channel;
}