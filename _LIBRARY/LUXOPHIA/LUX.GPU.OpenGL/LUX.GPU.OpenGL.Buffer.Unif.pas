﻿unit LUX.GPU.OpenGL.Buffer.Unif;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

     IGLBufferU = interface( IGLBuffer )
     ['{923ECB97-7686-4B53-A9FC-AB4365C7CC4B}']
       ///// メソッド
       procedure Use( const BinP_:GLuint ); overload;
       procedure Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 ); overload;
       procedure Unuse( const BinP_:GLuint ); overload;
     end;

     //-------------------------------------------------------------------------

     TGLBufferU<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferU )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       ///// メソッド
       function InitAlign :GLint; override;
     public
       ///// メソッド
       procedure Use( const BinP_:GLuint ); overload;
       procedure Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 ); overload;
       procedure Unuse( const BinP_:GLuint ); overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferU<_TYPE_>.GetKind :GLenum;
begin
     Result := GL_UNIFORM_BUFFER;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLBufferU<_TYPE_>.InitAlign :GLint;
begin
     glGetIntegerv( GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT, @Result );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferU<_TYPE_>.Use( const BinP_:GLuint );
begin
     glBindBufferBase( GetKind, BinP_, _ID );
end;

procedure TGLBufferU<_TYPE_>.Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 );
begin
     glBindBufferRange( GetKind, BinP_, _ID, _Strid * Offs_, _Strid * Size_ );
end;

procedure TGLBufferU<_TYPE_>.Unuse( const BinP_:GLuint );
begin
     glBindBufferBase( GetKind, BinP_, 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■