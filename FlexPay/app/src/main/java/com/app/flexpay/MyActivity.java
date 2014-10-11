package com.app.flexpay;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.provider.Telephony;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.UUID;


public class MyActivity extends ActionBarActivity {

    //  private String[] colores;
    private ArrayAdapter<String> mArrayAdapter;


    // Objetos para Conexion Arduino
    private static final String TAG = "FlexPay";
    private static final int ENABLE_BLUETOOTH = 1;
    private BluetoothAdapter mBluetoothAdapter;
    private ArrayList<BluetoothDevice> btDeviceList = new ArrayList<BluetoothDevice>();
    private BluetoothSocket clientSocket;
    private BroadcastReceiver discoveryMonitor;


    Button buttonEnviar;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);


        //Se instancia el boton
        buttonEnviar = (Button) findViewById(R.id.button);

        //Obtiene el Bluetooth Adapter
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter == null) {
            //No se soporta bluetooh
            Toast.makeText(getApplicationContext(), "No hay soporte Bluetooth", Toast.LENGTH_SHORT).show();
            Log.d(TAG, "No hay soporte Bluetooth");
            finish();
        }


        //    colores = new String[]{"Rojo", "Verde", "Azul", "Cafe", "Negro", "Blanco"};
        mArrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_selectable_list_item);
        ListView lv = (ListView) findViewById(R.id.listView);
        lv.setAdapter(mArrayAdapter);


        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                BluetoothDevice device = btDeviceList.get(i);


                Log.d(TAG, "Dispositivo seleccionado: " + device.getName());

                // Intentamos conectar con el dispositivo remoto.
                if (connectRemoteDevice(device)) {
                    Toast.makeText(getApplicationContext(), "Conexion Exitosa con Flex POS", Toast.LENGTH_SHORT).show();
                    buttonEnviar.setEnabled(true);
                }
                /*if (clientSocket != null) {
                    if (clientSocket.isConnected()) {
                        Toast.makeText(getApplicationContext(), "Ya se encuentra conectado", Toast.LENGTH_SHORT).show();
                    }
                }*/
            }
        });


    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.my, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    private boolean connectRemoteDevice(BluetoothDevice device) {


        boolean connect = false;

        Log.d(TAG, "Connectando");
        try {
            // TODO: Conexion socket cliente.
            String mmUUID = "00001101-0000-1000-8000-00805F9B34FB";
            this.clientSocket = device.createRfcommSocketToServiceRecord(UUID.fromString(mmUUID));
            clientSocket.connect();
            connect = true;
        } catch (Exception e) {
            buttonEnviar.setEnabled(false);
            connect = false;
        }


        return connect;

    }

    protected void onResume() {
        super.onResume();

        // TODO:En caso de que el bluetooth no este activo, hacemos un Intent al sistema
        // para que nos lleve a la pantalla de activacion. Al volver de esta pantalla
        // ejecutara el metodo onActivityResult.
        if (!mBluetoothAdapter.isEnabled()) {
            Log.d(TAG, "Bluetooth apagado: Pedimos permiso para encenderlo.");
            startActivityForResult(new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE), ENABLE_BLUETOOTH);
        } else {
            Log.d(TAG, "Bluetooth encendido.");
            discoveryBluetooth();
        }

        // TODO: Registramos el BroadcasReceiver
        if (this.discoveryMonitor != null) {
            registerReceiver(discoveryMonitor, new IntentFilter(BluetoothAdapter.ACTION_DISCOVERY_STARTED));
            registerReceiver(discoveryMonitor, new IntentFilter(BluetoothAdapter.ACTION_DISCOVERY_FINISHED));
            registerReceiver(discoveryMonitor, new IntentFilter(BluetoothDevice.ACTION_FOUND));
        }
    }

    private void discoveryBluetooth() {

        // Limpiamos la lista de dispositivos detectados.
        mArrayAdapter.clear();
        btDeviceList.clear();

        // Aqui implementamos el BrodcastReceiver
        this.discoveryMonitor = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {

                if (BluetoothAdapter.ACTION_DISCOVERY_STARTED.equals(intent.getAction())) {
                    Log.d(TAG, "Discovery started...");
                } else if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED.equals((intent.getAction()))) {
                    Log.d(TAG, "Discovery complete.");
                } else if (BluetoothDevice.ACTION_FOUND.equals(intent.getAction())) {

                    //Añadimos el dispositivo encontrado al adaptador del ListView
                    String remoteName = intent.getStringExtra(BluetoothDevice.EXTRA_NAME);

                    // Recuperamos el dispositivo detectado y lo guardamos en el array de dispositivos.
                    if (remoteName.startsWith("Flex")) {
                        mArrayAdapter.add(remoteName);
                        Log.d(TAG, "Dispositivo detectado :" + remoteName);
                        BluetoothDevice removeDevice = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                        btDeviceList.add(removeDevice);
                    }
                }
            }
        };


        // TODO: Iniciamos la busqueda de dispositvos bluetooth.
        // Este metodo es muy lento y consumo mucha bateria
        // en otros capitulos veremos como usar otra tecnica.
        mBluetoothAdapter.startDiscovery();

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == ENABLE_BLUETOOTH) {
            if (resultCode == RESULT_OK) {
                Log.d(TAG, "Bluetooth: el usuario acepta encenderlo");
                // Ejecutamos el metodo dicoveryBluetooth
                // dicoveryBluetooth();
                discoveryBluetooth();
            } else {
                Log.d(TAG, "Bluetooth: el usuario NO acepta encenderlo");
            }
        }
    }

    @Override
    protected void onPause() {
        super.onPause();

        if (this.discoveryMonitor != null) {
            unregisterReceiver(discoveryMonitor);
        }

    }

    public void actionToggleLED(View v) {
        //Enviando informacion del telefono el arduino
        OutputStream mmOutStream = null;
        try {
            if (clientSocket.isConnected()) {

                //  TelephonyManager
                TelephonyManager tManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                String uid = tManager.getDeviceId();

                mmOutStream = clientSocket.getOutputStream();
                mmOutStream.write(uid.getBytes());
            } else {
                buttonEnviar.setEnabled(false);
                Toast.makeText(getApplicationContext(), "Not connected", Toast.LENGTH_SHORT).show();
            }
        } catch (IOException e) {
            Log.d(TAG, e.getMessage());
            buttonEnviar.setEnabled(false);
        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();

        try {
            if (clientSocket != null) {
                clientSocket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
