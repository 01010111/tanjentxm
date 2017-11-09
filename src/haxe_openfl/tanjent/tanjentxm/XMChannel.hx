/* Licensed under The MIT License (MIT), see license.txt*/
package tanjent.tanjentxm;

/** <p>
 * Holds a channel state of an {@link XMModule}.
 * </p>
 * @author Jonas Murman */
class XMChannel
{
   
	public var playing:Bool;
	public var noteDelay:Int;
	
	public var note:XMNote;
	public var amigaPeriod:Int;
	
	public var arpeggioTick:Int;
	
	public var portamentoUpDown:Int;
	public var finePortamentoUp:Int;
	public var finePortamentoDown:Int;
	public var extraFinePortamentoUp:Int;
	public var extraFinePortamentoDown:Int;
	    	
	public var tonePortamento:Int;
	public var tonePortamentoDestinationAmigaPeriod:Int;	
	
	public var vibrato:Int;
	public var vibratoDepth:Int;
	public var vibratoPhase:Int;
	public var vibratoWaveform:Int;
	public var vibratoAmigaPeriodAdd:Float;
	public static var VIBRATO_WAVEFORM_SIZE:Int = (1 << 10);
	public static var VIBRATO_WAVEFORM_SIZE_MASK:Int = (XMChannel.VIBRATO_WAVEFORM_SIZE - 1);
		
	public var VIBRATO_WAVEFORM_SINE:Array<Float>;
	public var VIBRATO_WAVEFORM_SAW:Array<Float>;
	public var VIBRATO_WAVEFORM_SQUARE:Array<Float>;
	public var VIBRATO_WAVEFORM_RANDOM:Array<Float>;
	public var VIBRATO_WAVEFORMS:Array<Array<Float>>;
		
	public var autoVibratoEnabled:Bool;
	public var autoVibratoTicks:Int;
	public var autoVibratoPhase:Int;
	public var autoVibratoAmigaPeriodAdd:Float;
	public static var AUTOVIBRATO_WAVEFORM_SIZE:Int = (1 << 8);
	public static var AUTOVIBRATO_WAVEFORM_SIZE_MASK:Int = (XMChannel.AUTOVIBRATO_WAVEFORM_SIZE - 1);
	public var AUTOVIBRATO_WAVEFORM_SINE:Array<Float>;
	public var AUTOVIBRATO_WAVEFORM_SQUARE:Array<Float>;
	public var AUTOVIBRATO_WAVEFORM_RAMPUP:Array<Float>;
	public var AUTOVIBRATO_WAVEFORM_RAMPDOWN:Array<Float>;
	public var AUTOVIBRATO_WAVEFORM_RANDOM:Array<Float>;
	public var AUTOVIBRATO_WAVEFORMS:Array<Array<Float>>;
	
	// generated by round(-64*sin(i/256*2*pi)) (i = 0 ... 255)	
	public static var AUTOVIBRATO_SINE_TABLE:Array<Int> = [
		  0,  -2,  -3,  -5,  -6,  -8,  -9, -11, -12, -14, -16, -17, -19, -20, -22, -23,
		-24, -26, -27, -29, -30, -32, -33, -34, -36, -37, -38, -39, -41, -42, -43, -44,
		-45, -46, -47, -48, -49, -50, -51, -52, -53, -54, -55, -56, -56, -57, -58, -59,
		-59, -60, -60, -61, -61, -62, -62, -62, -63, -63, -63, -64, -64, -64, -64, -64,
		-64, -64, -64, -64, -64, -64, -63, -63, -63, -62, -62, -62, -61, -61, -60, -60,
		-59, -59, -58, -57, -56, -56, -55, -54, -53, -52, -51, -50, -49, -48, -47, -46,
		-45, -44, -43, -42, -41, -39, -38, -37, -36, -34, -33, -32, -30, -29, -27, -26,
		-24, -23, -22, -20, -19, -17, -16, -14, -12, -11,  -9,  -8,  -6,  -5,  -3,  -2,
		  0,   2,   3,   5,   6,   8,   9,  11,  12,  14,  16,  17,  19,  20,  22,  23,
		  24, 26,  27,  29,  30,  32,  33,  34,  36,  37,  38,  39,  41,  42,  43,  44,
		  45, 46,  47,  48,  49,  50,  51,  52,  53,  54,  55,  56,  56,  57,  58,  59,
		  59, 60,  60,  61,  61,  62,  62,  62,  63,  63,  63,  64,  64,  64,  64,  64,
		  64, 64,  64,  64,  64,  64,  63,  63,  63,  62,  62,	62,  61,  61,  60,  60,
		  59, 59,  58,  57,  56,  56,  55,  54,  53,  52,  51,  50,  49,  48,  47,  46,
		  45, 44,  43,  42,  41,  39,  38,  37,  36,  34,  33,  32,  30,  29,  27,	26,
		  24, 23,  22,  20,  19,  17,  16,  14,  12,  11,   9,   8,   6,   5,   3,   2]; 	
	   	
	public var instrumentColumnMemory:Int;
	
	public var sample:XMSample;
	public var samplePosition:Float;
	public var samplePositionAddTickStart:Float;
	public var samplePositionAddTickEnd:Float;
	public var sampleOffsetMemory:Int;
		
	public static var MAX_VOLUME:Float = 64.0;
	public var defaultVolumeMemory:Int;
	public var volumeSlideMemory:Int;
	public var volumeSlideTickDeltaFP:Int;
	public var volumeSlideUpFineMemory:Int;
	public var volumeSlideDownFineMemory:Int;
	public var volumeSlideFineTickDeltaFP:Int;
	public var volumeFP:Int;	
	public var volumeFP_LPF:Int;
	        	
	public var volumeFactorTickStart:Float;
	public var volumeFactorTickEnd:Float;

	public var volumeEnvelopeDone:Bool;
	public var volumeEnvelopeTick:Int;
	public var volumeEnvelopePoint:Int;
	public var volumeEnvelopeValue:Float;
	public var volumeEnvelopeValueTickAdd:Float;
		
	public var inRelease:Bool;
	
	public var fadeOut:Int;
	   	
	public var multiRetrigVolumeSlideMemory:Int;
	
	public var tremolo:Int;
	public var tremoloDepth:Float;
	public var tremoloPhase:Int;
	public var tremoloWaveform:Int;
	public static var TREMOLO_WAVEFORM_SIZE:Int = 0x400;
	public static var TREMOLO_WAVEFORM_SIZE_MASK:Int = (TREMOLO_WAVEFORM_SIZE - 1);
	public var TREMOLO_WAVEFORM_SINE:Array<Float>;
	public var TREMOLO_WAVEFORM_SAW:Array<Float>;
	public var TREMOLO_WAVEFORM_SQUARE:Array<Float>;
	public var TREMOLO_WAVEFORM_RANDOM:Array<Float>;
	public var TREMOLO_WAVEFORMS:Array<Array<Float>>;
		
	public static var TREMOR_STATE_ON:Int = 0;
	public static var TREMOR_STATE_OFF:Int = 1;
	public var tremorMemory:Int;
	public var tremorState:Int;	
	public var tremorCountOn:Int;
	public var tremorCountOff:Int;
	public var tremorOnTicks:Int;
	public var tremorOffTicks:Int;
	    
	public var panningLeftFP:Int;
	public var panningRightFP:Int;
	public var panningSlideMemory:Int;
	public var panningSlideTickDeltaFP:Int;
	
	public var panningEnvelopeDone:Bool;
	public var panningEnvelopeTick:Int;
	public var panningEnvelopePoint:Int;	
	public var panningEnvelopeValue:Float;
	public var panningEnvelopeValueTickAdd:Float;	
	public var panningEnvelopeLeftValueTickStart:Float;
	public var panningEnvelopeRightValueTickStart:Float;
	public var panningEnvelopeLeftValueTickEnd:Float;
	public var panningEnvelopeRightValueTickEnd:Float;
	
	/**
	 * Creates a new channel and initializes vibrato, autovibrato and tremolo tables. 
	 */
	public function new() 
	{
		this.VIBRATO_WAVEFORM_SINE = new Array<Float>();
		this.VIBRATO_WAVEFORM_SAW = new Array<Float>();
		this.VIBRATO_WAVEFORM_SQUARE = new Array<Float>();
		this.VIBRATO_WAVEFORM_RANDOM = new Array<Float>();		
		for (i in 0 ... XMChannel.VIBRATO_WAVEFORM_SIZE) {
			if (i < (XMChannel.VIBRATO_WAVEFORM_SIZE >> 1)) {
			    this.VIBRATO_WAVEFORM_SAW[i] = i / (XMChannel.VIBRATO_WAVEFORM_SIZE >> 1);
			    this.VIBRATO_WAVEFORM_SQUARE[i] = 1.0;
			} else {
				this.VIBRATO_WAVEFORM_SAW[i] = -1 + (i - (XMChannel.VIBRATO_WAVEFORM_SIZE >> 1)) / (XMChannel.VIBRATO_WAVEFORM_SIZE >> 1);
			    this.VIBRATO_WAVEFORM_SQUARE[i] = -1.0;
			}
			this.VIBRATO_WAVEFORM_SINE[i] = Math.sin(i / XMChannel.VIBRATO_WAVEFORM_SIZE * Math.PI * 2);
			this.VIBRATO_WAVEFORM_RANDOM[i] = (Math.random() - 0.5) * 2.0;
		}	
		this.VIBRATO_WAVEFORMS = [];
		this.VIBRATO_WAVEFORMS[0] = this.VIBRATO_WAVEFORM_SINE;
		this.VIBRATO_WAVEFORMS[1] = this.VIBRATO_WAVEFORM_SAW;
		this.VIBRATO_WAVEFORMS[2] = this.VIBRATO_WAVEFORM_SQUARE;
		this.VIBRATO_WAVEFORMS[3] = this.VIBRATO_WAVEFORM_RANDOM;
		this.VIBRATO_WAVEFORMS[4] = this.VIBRATO_WAVEFORM_SINE;
		this.VIBRATO_WAVEFORMS[5] = this.VIBRATO_WAVEFORM_SAW;
		this.VIBRATO_WAVEFORMS[6] = this.VIBRATO_WAVEFORM_SQUARE;
		this.VIBRATO_WAVEFORMS[7] = this.VIBRATO_WAVEFORM_RANDOM;	
		
		this.AUTOVIBRATO_WAVEFORM_SINE = new Array<Float>();
		this.AUTOVIBRATO_WAVEFORM_SQUARE = new Array<Float>();
		this.AUTOVIBRATO_WAVEFORM_RAMPUP = new Array<Float>();
		this.AUTOVIBRATO_WAVEFORM_RAMPDOWN = new Array<Float>();
		this.AUTOVIBRATO_WAVEFORM_RANDOM = new Array<Float>();
		for (i in 0 ... XMChannel.AUTOVIBRATO_WAVEFORM_SIZE) {
			if (i < (XMChannel.AUTOVIBRATO_WAVEFORM_SIZE >> 1)) {
			    this.AUTOVIBRATO_WAVEFORM_SQUARE[i] = (-1.0);
				this.AUTOVIBRATO_WAVEFORM_RAMPUP[i] = 1.0 * (i / (XMChannel.AUTOVIBRATO_WAVEFORM_SIZE >> 1));
			} else {
			    this.AUTOVIBRATO_WAVEFORM_SQUARE[i] = (1.0);
				this.AUTOVIBRATO_WAVEFORM_RAMPUP[i] = 1.0 * (-1 + (i - (XMChannel.AUTOVIBRATO_WAVEFORM_SIZE >> 1)) / (XMChannel.AUTOVIBRATO_WAVEFORM_SIZE >> 1));
			}
			this.AUTOVIBRATO_WAVEFORM_RAMPDOWN[i] = (-this.AUTOVIBRATO_WAVEFORM_RAMPUP[i]);
			this.AUTOVIBRATO_WAVEFORM_SINE[i] = XMChannel.AUTOVIBRATO_SINE_TABLE[i] / 64.0;
			this.AUTOVIBRATO_WAVEFORM_RANDOM[i] = 1.0 * ((Math.random() - 0.5) * 2.0);
		}
		this.AUTOVIBRATO_WAVEFORMS = [];
		this.AUTOVIBRATO_WAVEFORMS[0] = this.AUTOVIBRATO_WAVEFORM_SINE;
		this.AUTOVIBRATO_WAVEFORMS[1] = this.AUTOVIBRATO_WAVEFORM_SQUARE;
		this.AUTOVIBRATO_WAVEFORMS[2] = this.AUTOVIBRATO_WAVEFORM_RAMPUP;
		this.AUTOVIBRATO_WAVEFORMS[3] = this.AUTOVIBRATO_WAVEFORM_RAMPDOWN;
		this.AUTOVIBRATO_WAVEFORMS[4] = this.AUTOVIBRATO_WAVEFORM_RANDOM;
		
		this.TREMOLO_WAVEFORM_SINE = new Array<Float>();
		this.TREMOLO_WAVEFORM_SAW = new Array<Float>();
		this.TREMOLO_WAVEFORM_SQUARE = new Array<Float>();
		this.TREMOLO_WAVEFORM_RANDOM = new Array<Float>();
		for (i in 0 ... XMChannel.TREMOLO_WAVEFORM_SIZE) {
			if (i < (XMChannel.TREMOLO_WAVEFORM_SIZE >> 1)) {
				this.TREMOLO_WAVEFORM_SINE[i] = (0);
				this.TREMOLO_WAVEFORM_SAW[i] = (1.0 - ((XMChannel.TREMOLO_WAVEFORM_SIZE >> 1) - i) / (XMChannel.TREMOLO_WAVEFORM_SIZE >> 1));
			    this.TREMOLO_WAVEFORM_SQUARE[i] = (0);
			} else {
				this.TREMOLO_WAVEFORM_SINE[i] = (-Math.sin(i / XMChannel.TREMOLO_WAVEFORM_SIZE * Math.PI * 2.0));
				this.TREMOLO_WAVEFORM_SAW[i] = (0);
			    this.TREMOLO_WAVEFORM_SQUARE[i] = (1);
			}
			this.TREMOLO_WAVEFORM_RANDOM[i] = Math.random();
		}
		this.TREMOLO_WAVEFORMS = [];
		this.TREMOLO_WAVEFORMS[0] = this.TREMOLO_WAVEFORM_SINE;
		this.TREMOLO_WAVEFORMS[1] = this.TREMOLO_WAVEFORM_SAW;
		this.TREMOLO_WAVEFORMS[2] = this.TREMOLO_WAVEFORM_SQUARE;
		this.TREMOLO_WAVEFORMS[3] = this.TREMOLO_WAVEFORM_RANDOM;
		this.TREMOLO_WAVEFORMS[4] = this.TREMOLO_WAVEFORM_SINE;
		this.TREMOLO_WAVEFORMS[5] = this.TREMOLO_WAVEFORM_SAW;
		this.TREMOLO_WAVEFORMS[6] = this.TREMOLO_WAVEFORM_SQUARE;
		this.TREMOLO_WAVEFORMS[7] = this.TREMOLO_WAVEFORM_RANDOM;	
		
		this.reset();
	}
	
	/**
	 * Stops the channel from playing and resets all effect memories. 
	 */
	public function reset()
	{
		this.playing = false;
		this.noteDelay = 0;
		
		this.note = new XMNote();
		this.amigaPeriod = 0;
		
		this.arpeggioTick = 0;
		
		this.portamentoUpDown = 0;
		this.finePortamentoUp = 0;
		this.finePortamentoDown = 0;
		this.extraFinePortamentoUp = 0;
		this.extraFinePortamentoDown = 0;
		
		this.tonePortamento = 0;
		this.tonePortamentoDestinationAmigaPeriod = 0;
		
		this.vibrato = 0;
		this.vibratoDepth = 0;
		this.vibratoPhase = 0;
		this.vibratoWaveform = 0;
		this.vibratoAmigaPeriodAdd = 0;
		
		this.autoVibratoEnabled = false;
		this.autoVibratoTicks = 0;
		this.autoVibratoPhase = 0;		
		this.autoVibratoAmigaPeriodAdd = 0;
		
		this.instrumentColumnMemory = 0;
		
		this.sample = new XMSample();		
		this.samplePosition = 0;
		this.samplePositionAddTickStart = 0;
		this.samplePositionAddTickEnd = 0;
		this.sampleOffsetMemory = 0;
		
		this.defaultVolumeMemory = 0;
		this.volumeSlideMemory = 0;
		this.volumeSlideTickDeltaFP = 0;
		this.volumeSlideUpFineMemory = 0;
		this.volumeSlideDownFineMemory = 0;
		this.volumeSlideFineTickDeltaFP = 0;
		this.volumeFP = 0;
		this.volumeFP_LPF = 0;
		
		this.volumeFactorTickStart = 0.0;
		this.volumeFactorTickEnd = 0.0;		
		
		this.volumeEnvelopeDone = true;
		this.volumeEnvelopeTick = 0;
		this.volumeEnvelopePoint = 0;
		this.volumeEnvelopeValue = 0;
		this.volumeEnvelopeValueTickAdd = 0;
		
		this.inRelease = false;
		this.fadeOut = XMInstrument.FADEOUT_MAX;
				
		this.multiRetrigVolumeSlideMemory = 0x08;
		
		this.tremolo = 0;
		this.tremoloDepth = 0;
		this.tremoloPhase = 0;
		this.tremoloWaveform = 0;
								
		this.tremorMemory = 0;
		this.tremorState = XMChannel.TREMOR_STATE_OFF;
		this.tremorCountOn = 0;
		this.tremorCountOff = 0;
		this.tremorOnTicks = 0;
		this.tremorOffTicks = 0;
		
		this.panningLeftFP = FixedPoint.FP_HALF;
		this.panningRightFP = FixedPoint.FP_HALF;
		this.panningSlideMemory = 0;
		this.panningSlideTickDeltaFP = 0;
				
		this.panningEnvelopeDone = false;
		this.panningEnvelopeTick = 0;
		this.panningEnvelopePoint = 0;
		this.panningEnvelopeValue = 0.0;
		this.panningEnvelopeValueTickAdd = 0.0;
		this.panningEnvelopeLeftValueTickStart = 0.0;
		this.panningEnvelopeRightValueTickStart = 0.0;
		this.panningEnvelopeLeftValueTickEnd = 0.0;
		this.panningEnvelopeRightValueTickEnd = 0.0;
	}
}